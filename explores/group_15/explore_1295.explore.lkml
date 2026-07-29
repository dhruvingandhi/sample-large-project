# Explore: explore_1295
# Auto-generated LookML Explore File

include: "/views/domain_36/view_03886.view.lkml"
include: "/views/domain_38/view_03888.view.lkml"
include: "/views/domain_39/view_03889.view.lkml"
include: "/views/domain_40/view_03890.view.lkml"

explore: explore_1295 {
  label: "Explore Explore 1295"
  description: "Comprehensive analytics explore joining base view_03886 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03886
  
  always_filter: {
    filters: [view_03886.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03886.created_at_date: "7 days"]
    unless: [view_03886.id, view_03886.status]
  }

  join: view_03888 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03886.user_id} = ${view_03888.id} ;;
    required_joins: []
  }

  join: view_03889 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03886.account_id} = ${view_03889.account_id} ;;
    required_joins: [view_03888]
  }

  join: view_03890 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03886.category} = ${view_03890.category} ;;
  }

  access_filter: {
    field: view_03886.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03886.is_deleted} = false ;;
}
