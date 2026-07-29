# Explore: explore_1411
# Auto-generated LookML Explore File

include: "/views/domain_34/view_04234.view.lkml"
include: "/views/domain_36/view_04236.view.lkml"
include: "/views/domain_37/view_04237.view.lkml"
include: "/views/domain_38/view_04238.view.lkml"

explore: explore_1411 {
  label: "Explore Explore 1411"
  description: "Comprehensive analytics explore joining base view_04234 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04234
  
  always_filter: {
    filters: [view_04234.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04234.created_at_date: "7 days"]
    unless: [view_04234.id, view_04234.status]
  }

  join: view_04236 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04234.user_id} = ${view_04236.id} ;;
    required_joins: []
  }

  join: view_04237 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04234.account_id} = ${view_04237.account_id} ;;
    required_joins: [view_04236]
  }

  join: view_04238 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04234.category} = ${view_04238.category} ;;
  }

  access_filter: {
    field: view_04234.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04234.is_deleted} = false ;;
}
