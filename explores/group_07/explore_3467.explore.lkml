# Explore: explore_3467
# Auto-generated LookML Explore File

include: "/views/domain_02/view_10402.view.lkml"
include: "/views/domain_04/view_10404.view.lkml"
include: "/views/domain_05/view_10405.view.lkml"
include: "/views/domain_06/view_10406.view.lkml"

explore: explore_3467 {
  label: "Explore Explore 3467"
  description: "Comprehensive analytics explore joining base view_10402 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10402
  
  always_filter: {
    filters: [view_10402.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10402.created_at_date: "7 days"]
    unless: [view_10402.id, view_10402.status]
  }

  join: view_10404 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10402.user_id} = ${view_10404.id} ;;
    required_joins: []
  }

  join: view_10405 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10402.account_id} = ${view_10405.account_id} ;;
    required_joins: [view_10404]
  }

  join: view_10406 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10402.category} = ${view_10406.category} ;;
  }

  access_filter: {
    field: view_10402.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10402.is_deleted} = false ;;
}
