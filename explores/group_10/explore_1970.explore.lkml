# Explore: explore_1970
# Auto-generated LookML Explore File

include: "/views/domain_11/view_05911.view.lkml"
include: "/views/domain_13/view_05913.view.lkml"
include: "/views/domain_14/view_05914.view.lkml"
include: "/views/domain_15/view_05915.view.lkml"

explore: explore_1970 {
  label: "Explore Explore 1970"
  description: "Comprehensive analytics explore joining base view_05911 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05911
  
  always_filter: {
    filters: [view_05911.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05911.created_at_date: "7 days"]
    unless: [view_05911.id, view_05911.status]
  }

  join: view_05913 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05911.user_id} = ${view_05913.id} ;;
    required_joins: []
  }

  join: view_05914 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05911.account_id} = ${view_05914.account_id} ;;
    required_joins: [view_05913]
  }

  join: view_05915 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05911.category} = ${view_05915.category} ;;
  }

  access_filter: {
    field: view_05911.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05911.is_deleted} = false ;;
}
