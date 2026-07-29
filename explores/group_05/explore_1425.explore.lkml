# Explore: explore_1425
# Auto-generated LookML Explore File

include: "/views/domain_26/view_04276.view.lkml"
include: "/views/domain_28/view_04278.view.lkml"
include: "/views/domain_29/view_04279.view.lkml"
include: "/views/domain_30/view_04280.view.lkml"

explore: explore_1425 {
  label: "Explore Explore 1425"
  description: "Comprehensive analytics explore joining base view_04276 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04276
  
  always_filter: {
    filters: [view_04276.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04276.created_at_date: "7 days"]
    unless: [view_04276.id, view_04276.status]
  }

  join: view_04278 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04276.user_id} = ${view_04278.id} ;;
    required_joins: []
  }

  join: view_04279 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04276.account_id} = ${view_04279.account_id} ;;
    required_joins: [view_04278]
  }

  join: view_04280 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04276.category} = ${view_04280.category} ;;
  }

  access_filter: {
    field: view_04276.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04276.is_deleted} = false ;;
}
