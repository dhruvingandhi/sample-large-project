# Explore: explore_3816
# Auto-generated LookML Explore File

include: "/views/domain_49/view_11449.view.lkml"
include: "/views/domain_01/view_11451.view.lkml"
include: "/views/domain_02/view_11452.view.lkml"
include: "/views/domain_03/view_11453.view.lkml"

explore: explore_3816 {
  label: "Explore Explore 3816"
  description: "Comprehensive analytics explore joining base view_11449 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11449
  
  always_filter: {
    filters: [view_11449.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11449.created_at_date: "7 days"]
    unless: [view_11449.id, view_11449.status]
  }

  join: view_11451 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11449.user_id} = ${view_11451.id} ;;
    required_joins: []
  }

  join: view_11452 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11449.account_id} = ${view_11452.account_id} ;;
    required_joins: [view_11451]
  }

  join: view_11453 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11449.category} = ${view_11453.category} ;;
  }

  access_filter: {
    field: view_11449.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11449.is_deleted} = false ;;
}
