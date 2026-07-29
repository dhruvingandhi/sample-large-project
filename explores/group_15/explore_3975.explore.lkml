# Explore: explore_3975
# Auto-generated LookML Explore File

include: "/views/domain_26/view_11926.view.lkml"
include: "/views/domain_28/view_11928.view.lkml"
include: "/views/domain_29/view_11929.view.lkml"
include: "/views/domain_30/view_11930.view.lkml"

explore: explore_3975 {
  label: "Explore Explore 3975"
  description: "Comprehensive analytics explore joining base view_11926 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11926
  
  always_filter: {
    filters: [view_11926.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11926.created_at_date: "7 days"]
    unless: [view_11926.id, view_11926.status]
  }

  join: view_11928 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11926.user_id} = ${view_11928.id} ;;
    required_joins: []
  }

  join: view_11929 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11926.account_id} = ${view_11929.account_id} ;;
    required_joins: [view_11928]
  }

  join: view_11930 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11926.category} = ${view_11930.category} ;;
  }

  access_filter: {
    field: view_11926.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11926.is_deleted} = false ;;
}
