# Explore: explore_1797
# Auto-generated LookML Explore File

include: "/views/domain_42/view_05392.view.lkml"
include: "/views/domain_44/view_05394.view.lkml"
include: "/views/domain_45/view_05395.view.lkml"
include: "/views/domain_46/view_05396.view.lkml"

explore: explore_1797 {
  label: "Explore Explore 1797"
  description: "Comprehensive analytics explore joining base view_05392 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05392
  
  always_filter: {
    filters: [view_05392.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05392.created_at_date: "7 days"]
    unless: [view_05392.id, view_05392.status]
  }

  join: view_05394 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05392.user_id} = ${view_05394.id} ;;
    required_joins: []
  }

  join: view_05395 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05392.account_id} = ${view_05395.account_id} ;;
    required_joins: [view_05394]
  }

  join: view_05396 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05392.category} = ${view_05396.category} ;;
  }

  access_filter: {
    field: view_05392.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05392.is_deleted} = false ;;
}
