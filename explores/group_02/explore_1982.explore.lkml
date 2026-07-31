# Update for 500 file diff target
# Explore: explore_1982
# Auto-generated LookML Explore File

include: "/views/domain_47/view_05947.view.lkml"
include: "/views/domain_49/view_05949.view.lkml"
include: "/views/domain_50/view_05950.view.lkml"
include: "/views/domain_01/view_05951.view.lkml"

explore: explore_1982 {
  label: "Explore Explore 1982"
  description: "Comprehensive analytics explore joining base view_05947 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05947
  
  always_filter: {
    filters: [view_05947.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05947.created_at_date: "7 days"]
    unless: [view_05947.id, view_05947.status]
  }

  join: view_05949 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05947.user_id} = ${view_05949.id} ;;
    required_joins: []
  }

  join: view_05950 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05947.account_id} = ${view_05950.account_id} ;;
    required_joins: [view_05949]
  }

  join: view_05951 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05947.category} = ${view_05951.category} ;;
  }

  access_filter: {
    field: view_05947.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05947.is_deleted} = false ;;
}
