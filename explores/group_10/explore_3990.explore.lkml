# Update for 2000 file diff target
# Explore: explore_3990
# Auto-generated LookML Explore File

include: "/views/domain_21/view_11971.view.lkml"
include: "/views/domain_23/view_11973.view.lkml"
include: "/views/domain_24/view_11974.view.lkml"
include: "/views/domain_25/view_11975.view.lkml"

explore: explore_3990 {
  label: "Explore Explore 3990"
  description: "Comprehensive analytics explore joining base view_11971 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11971
  
  always_filter: {
    filters: [view_11971.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11971.created_at_date: "7 days"]
    unless: [view_11971.id, view_11971.status]
  }

  join: view_11973 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11971.user_id} = ${view_11973.id} ;;
    required_joins: []
  }

  join: view_11974 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11971.account_id} = ${view_11974.account_id} ;;
    required_joins: [view_11973]
  }

  join: view_11975 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11971.category} = ${view_11975.category} ;;
  }

  access_filter: {
    field: view_11971.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11971.is_deleted} = false ;;
}
