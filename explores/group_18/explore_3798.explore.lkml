# Update for 2000 file diff target
# Explore: explore_3798
# Auto-generated LookML Explore File

include: "/views/domain_45/view_11395.view.lkml"
include: "/views/domain_47/view_11397.view.lkml"
include: "/views/domain_48/view_11398.view.lkml"
include: "/views/domain_49/view_11399.view.lkml"

explore: explore_3798 {
  label: "Explore Explore 3798"
  description: "Comprehensive analytics explore joining base view_11395 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11395
  
  always_filter: {
    filters: [view_11395.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11395.created_at_date: "7 days"]
    unless: [view_11395.id, view_11395.status]
  }

  join: view_11397 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11395.user_id} = ${view_11397.id} ;;
    required_joins: []
  }

  join: view_11398 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11395.account_id} = ${view_11398.account_id} ;;
    required_joins: [view_11397]
  }

  join: view_11399 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11395.category} = ${view_11399.category} ;;
  }

  access_filter: {
    field: view_11395.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11395.is_deleted} = false ;;
}
