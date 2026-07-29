# Explore: explore_0816
# Auto-generated LookML Explore File

include: "/views/domain_49/view_02449.view.lkml"
include: "/views/domain_01/view_02451.view.lkml"
include: "/views/domain_02/view_02452.view.lkml"
include: "/views/domain_03/view_02453.view.lkml"

explore: explore_0816 {
  label: "Explore Explore 0816"
  description: "Comprehensive analytics explore joining base view_02449 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02449
  
  always_filter: {
    filters: [view_02449.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02449.created_at_date: "7 days"]
    unless: [view_02449.id, view_02449.status]
  }

  join: view_02451 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02449.user_id} = ${view_02451.id} ;;
    required_joins: []
  }

  join: view_02452 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02449.account_id} = ${view_02452.account_id} ;;
    required_joins: [view_02451]
  }

  join: view_02453 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02449.category} = ${view_02453.category} ;;
  }

  access_filter: {
    field: view_02449.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02449.is_deleted} = false ;;
}
