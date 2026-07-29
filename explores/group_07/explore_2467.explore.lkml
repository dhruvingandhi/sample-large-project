# Explore: explore_2467
# Auto-generated LookML Explore File

include: "/views/domain_02/view_07402.view.lkml"
include: "/views/domain_04/view_07404.view.lkml"
include: "/views/domain_05/view_07405.view.lkml"
include: "/views/domain_06/view_07406.view.lkml"

explore: explore_2467 {
  label: "Explore Explore 2467"
  description: "Comprehensive analytics explore joining base view_07402 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07402
  
  always_filter: {
    filters: [view_07402.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07402.created_at_date: "7 days"]
    unless: [view_07402.id, view_07402.status]
  }

  join: view_07404 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07402.user_id} = ${view_07404.id} ;;
    required_joins: []
  }

  join: view_07405 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07402.account_id} = ${view_07405.account_id} ;;
    required_joins: [view_07404]
  }

  join: view_07406 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07402.category} = ${view_07406.category} ;;
  }

  access_filter: {
    field: view_07402.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07402.is_deleted} = false ;;
}
