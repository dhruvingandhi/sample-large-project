# Update for 2000 file diff target
# Explore: explore_3360
# Auto-generated LookML Explore File

include: "/views/domain_31/view_10081.view.lkml"
include: "/views/domain_33/view_10083.view.lkml"
include: "/views/domain_34/view_10084.view.lkml"
include: "/views/domain_35/view_10085.view.lkml"

explore: explore_3360 {
  label: "Explore Explore 3360"
  description: "Comprehensive analytics explore joining base view_10081 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10081
  
  always_filter: {
    filters: [view_10081.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10081.created_at_date: "7 days"]
    unless: [view_10081.id, view_10081.status]
  }

  join: view_10083 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10081.user_id} = ${view_10083.id} ;;
    required_joins: []
  }

  join: view_10084 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10081.account_id} = ${view_10084.account_id} ;;
    required_joins: [view_10083]
  }

  join: view_10085 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10081.category} = ${view_10085.category} ;;
  }

  access_filter: {
    field: view_10081.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10081.is_deleted} = false ;;
}
