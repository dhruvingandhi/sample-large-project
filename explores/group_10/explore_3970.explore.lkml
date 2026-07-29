# Explore: explore_3970
# Auto-generated LookML Explore File

include: "/views/domain_11/view_11911.view.lkml"
include: "/views/domain_13/view_11913.view.lkml"
include: "/views/domain_14/view_11914.view.lkml"
include: "/views/domain_15/view_11915.view.lkml"

explore: explore_3970 {
  label: "Explore Explore 3970"
  description: "Comprehensive analytics explore joining base view_11911 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11911
  
  always_filter: {
    filters: [view_11911.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11911.created_at_date: "7 days"]
    unless: [view_11911.id, view_11911.status]
  }

  join: view_11913 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11911.user_id} = ${view_11913.id} ;;
    required_joins: []
  }

  join: view_11914 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11911.account_id} = ${view_11914.account_id} ;;
    required_joins: [view_11913]
  }

  join: view_11915 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11911.category} = ${view_11915.category} ;;
  }

  access_filter: {
    field: view_11911.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11911.is_deleted} = false ;;
}
