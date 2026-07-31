# Update for 2000 file diff target
# Explore: explore_3650
# Auto-generated LookML Explore File

include: "/views/domain_01/view_10951.view.lkml"
include: "/views/domain_03/view_10953.view.lkml"
include: "/views/domain_04/view_10954.view.lkml"
include: "/views/domain_05/view_10955.view.lkml"

explore: explore_3650 {
  label: "Explore Explore 3650"
  description: "Comprehensive analytics explore joining base view_10951 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10951
  
  always_filter: {
    filters: [view_10951.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10951.created_at_date: "7 days"]
    unless: [view_10951.id, view_10951.status]
  }

  join: view_10953 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10951.user_id} = ${view_10953.id} ;;
    required_joins: []
  }

  join: view_10954 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10951.account_id} = ${view_10954.account_id} ;;
    required_joins: [view_10953]
  }

  join: view_10955 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10951.category} = ${view_10955.category} ;;
  }

  access_filter: {
    field: view_10951.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10951.is_deleted} = false ;;
}
