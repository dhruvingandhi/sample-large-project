# Explore: explore_1873
# Auto-generated LookML Explore File

include: "/views/domain_20/view_05620.view.lkml"
include: "/views/domain_22/view_05622.view.lkml"
include: "/views/domain_23/view_05623.view.lkml"
include: "/views/domain_24/view_05624.view.lkml"

explore: explore_1873 {
  label: "Explore Explore 1873"
  description: "Comprehensive analytics explore joining base view_05620 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05620
  
  always_filter: {
    filters: [view_05620.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05620.created_at_date: "7 days"]
    unless: [view_05620.id, view_05620.status]
  }

  join: view_05622 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05620.user_id} = ${view_05622.id} ;;
    required_joins: []
  }

  join: view_05623 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05620.account_id} = ${view_05623.account_id} ;;
    required_joins: [view_05622]
  }

  join: view_05624 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05620.category} = ${view_05624.category} ;;
  }

  access_filter: {
    field: view_05620.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05620.is_deleted} = false ;;
}
