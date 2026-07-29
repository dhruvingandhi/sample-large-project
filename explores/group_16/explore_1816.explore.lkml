# Explore: explore_1816
# Auto-generated LookML Explore File

include: "/views/domain_49/view_05449.view.lkml"
include: "/views/domain_01/view_05451.view.lkml"
include: "/views/domain_02/view_05452.view.lkml"
include: "/views/domain_03/view_05453.view.lkml"

explore: explore_1816 {
  label: "Explore Explore 1816"
  description: "Comprehensive analytics explore joining base view_05449 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05449
  
  always_filter: {
    filters: [view_05449.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05449.created_at_date: "7 days"]
    unless: [view_05449.id, view_05449.status]
  }

  join: view_05451 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05449.user_id} = ${view_05451.id} ;;
    required_joins: []
  }

  join: view_05452 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05449.account_id} = ${view_05452.account_id} ;;
    required_joins: [view_05451]
  }

  join: view_05453 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05449.category} = ${view_05453.category} ;;
  }

  access_filter: {
    field: view_05449.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05449.is_deleted} = false ;;
}
