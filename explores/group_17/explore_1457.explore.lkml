# Explore: explore_1457
# Auto-generated LookML Explore File

include: "/views/domain_22/view_04372.view.lkml"
include: "/views/domain_24/view_04374.view.lkml"
include: "/views/domain_25/view_04375.view.lkml"
include: "/views/domain_26/view_04376.view.lkml"

explore: explore_1457 {
  label: "Explore Explore 1457"
  description: "Comprehensive analytics explore joining base view_04372 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04372
  
  always_filter: {
    filters: [view_04372.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04372.created_at_date: "7 days"]
    unless: [view_04372.id, view_04372.status]
  }

  join: view_04374 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04372.user_id} = ${view_04374.id} ;;
    required_joins: []
  }

  join: view_04375 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04372.account_id} = ${view_04375.account_id} ;;
    required_joins: [view_04374]
  }

  join: view_04376 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04372.category} = ${view_04376.category} ;;
  }

  access_filter: {
    field: view_04372.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04372.is_deleted} = false ;;
}
