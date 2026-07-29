# Explore: explore_1467
# Auto-generated LookML Explore File

include: "/views/domain_02/view_04402.view.lkml"
include: "/views/domain_04/view_04404.view.lkml"
include: "/views/domain_05/view_04405.view.lkml"
include: "/views/domain_06/view_04406.view.lkml"

explore: explore_1467 {
  label: "Explore Explore 1467"
  description: "Comprehensive analytics explore joining base view_04402 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04402
  
  always_filter: {
    filters: [view_04402.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04402.created_at_date: "7 days"]
    unless: [view_04402.id, view_04402.status]
  }

  join: view_04404 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04402.user_id} = ${view_04404.id} ;;
    required_joins: []
  }

  join: view_04405 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04402.account_id} = ${view_04405.account_id} ;;
    required_joins: [view_04404]
  }

  join: view_04406 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04402.category} = ${view_04406.category} ;;
  }

  access_filter: {
    field: view_04402.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04402.is_deleted} = false ;;
}
