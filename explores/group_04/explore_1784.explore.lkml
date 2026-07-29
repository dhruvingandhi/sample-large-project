# Explore: explore_1784
# Auto-generated LookML Explore File

include: "/views/domain_03/view_05353.view.lkml"
include: "/views/domain_05/view_05355.view.lkml"
include: "/views/domain_06/view_05356.view.lkml"
include: "/views/domain_07/view_05357.view.lkml"

explore: explore_1784 {
  label: "Explore Explore 1784"
  description: "Comprehensive analytics explore joining base view_05353 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05353
  
  always_filter: {
    filters: [view_05353.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05353.created_at_date: "7 days"]
    unless: [view_05353.id, view_05353.status]
  }

  join: view_05355 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05353.user_id} = ${view_05355.id} ;;
    required_joins: []
  }

  join: view_05356 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05353.account_id} = ${view_05356.account_id} ;;
    required_joins: [view_05355]
  }

  join: view_05357 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05353.category} = ${view_05357.category} ;;
  }

  access_filter: {
    field: view_05353.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05353.is_deleted} = false ;;
}
