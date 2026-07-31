# Update for 500 file diff target
# Explore: explore_1745
# Auto-generated LookML Explore File

include: "/views/domain_36/view_05236.view.lkml"
include: "/views/domain_38/view_05238.view.lkml"
include: "/views/domain_39/view_05239.view.lkml"
include: "/views/domain_40/view_05240.view.lkml"

explore: explore_1745 {
  label: "Explore Explore 1745"
  description: "Comprehensive analytics explore joining base view_05236 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05236
  
  always_filter: {
    filters: [view_05236.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05236.created_at_date: "7 days"]
    unless: [view_05236.id, view_05236.status]
  }

  join: view_05238 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05236.user_id} = ${view_05238.id} ;;
    required_joins: []
  }

  join: view_05239 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05236.account_id} = ${view_05239.account_id} ;;
    required_joins: [view_05238]
  }

  join: view_05240 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05236.category} = ${view_05240.category} ;;
  }

  access_filter: {
    field: view_05236.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05236.is_deleted} = false ;;
}
