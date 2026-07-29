# Explore: explore_3473
# Auto-generated LookML Explore File

include: "/views/domain_20/view_10420.view.lkml"
include: "/views/domain_22/view_10422.view.lkml"
include: "/views/domain_23/view_10423.view.lkml"
include: "/views/domain_24/view_10424.view.lkml"

explore: explore_3473 {
  label: "Explore Explore 3473"
  description: "Comprehensive analytics explore joining base view_10420 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10420
  
  always_filter: {
    filters: [view_10420.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10420.created_at_date: "7 days"]
    unless: [view_10420.id, view_10420.status]
  }

  join: view_10422 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10420.user_id} = ${view_10422.id} ;;
    required_joins: []
  }

  join: view_10423 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10420.account_id} = ${view_10423.account_id} ;;
    required_joins: [view_10422]
  }

  join: view_10424 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10420.category} = ${view_10424.category} ;;
  }

  access_filter: {
    field: view_10420.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10420.is_deleted} = false ;;
}
