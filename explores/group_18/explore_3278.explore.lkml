# Update for 2000 file diff target
# Explore: explore_3278
# Auto-generated LookML Explore File

include: "/views/domain_35/view_09835.view.lkml"
include: "/views/domain_37/view_09837.view.lkml"
include: "/views/domain_38/view_09838.view.lkml"
include: "/views/domain_39/view_09839.view.lkml"

explore: explore_3278 {
  label: "Explore Explore 3278"
  description: "Comprehensive analytics explore joining base view_09835 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09835
  
  always_filter: {
    filters: [view_09835.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09835.created_at_date: "7 days"]
    unless: [view_09835.id, view_09835.status]
  }

  join: view_09837 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09835.user_id} = ${view_09837.id} ;;
    required_joins: []
  }

  join: view_09838 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09835.account_id} = ${view_09838.account_id} ;;
    required_joins: [view_09837]
  }

  join: view_09839 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09835.category} = ${view_09839.category} ;;
  }

  access_filter: {
    field: view_09835.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09835.is_deleted} = false ;;
}
