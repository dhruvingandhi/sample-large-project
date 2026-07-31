# Update for 2000 file diff target
# Explore: explore_2970
# Auto-generated LookML Explore File

include: "/views/domain_11/view_08911.view.lkml"
include: "/views/domain_13/view_08913.view.lkml"
include: "/views/domain_14/view_08914.view.lkml"
include: "/views/domain_15/view_08915.view.lkml"

explore: explore_2970 {
  label: "Explore Explore 2970"
  description: "Comprehensive analytics explore joining base view_08911 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08911
  
  always_filter: {
    filters: [view_08911.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08911.created_at_date: "7 days"]
    unless: [view_08911.id, view_08911.status]
  }

  join: view_08913 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08911.user_id} = ${view_08913.id} ;;
    required_joins: []
  }

  join: view_08914 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08911.account_id} = ${view_08914.account_id} ;;
    required_joins: [view_08913]
  }

  join: view_08915 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08911.category} = ${view_08915.category} ;;
  }

  access_filter: {
    field: view_08911.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08911.is_deleted} = false ;;
}
