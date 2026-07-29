# Explore: explore_0975
# Auto-generated LookML Explore File

include: "/views/domain_26/view_02926.view.lkml"
include: "/views/domain_28/view_02928.view.lkml"
include: "/views/domain_29/view_02929.view.lkml"
include: "/views/domain_30/view_02930.view.lkml"

explore: explore_0975 {
  label: "Explore Explore 0975"
  description: "Comprehensive analytics explore joining base view_02926 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02926
  
  always_filter: {
    filters: [view_02926.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02926.created_at_date: "7 days"]
    unless: [view_02926.id, view_02926.status]
  }

  join: view_02928 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02926.user_id} = ${view_02928.id} ;;
    required_joins: []
  }

  join: view_02929 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02926.account_id} = ${view_02929.account_id} ;;
    required_joins: [view_02928]
  }

  join: view_02930 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02926.category} = ${view_02930.category} ;;
  }

  access_filter: {
    field: view_02926.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02926.is_deleted} = false ;;
}
