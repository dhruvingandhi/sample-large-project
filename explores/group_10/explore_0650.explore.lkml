# Update for 2000 file diff target
# Explore: explore_0650
# Auto-generated LookML Explore File

include: "/views/domain_01/view_01951.view.lkml"
include: "/views/domain_03/view_01953.view.lkml"
include: "/views/domain_04/view_01954.view.lkml"
include: "/views/domain_05/view_01955.view.lkml"

explore: explore_0650 {
  label: "Explore Explore 0650"
  description: "Comprehensive analytics explore joining base view_01951 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01951
  
  always_filter: {
    filters: [view_01951.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01951.created_at_date: "7 days"]
    unless: [view_01951.id, view_01951.status]
  }

  join: view_01953 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01951.user_id} = ${view_01953.id} ;;
    required_joins: []
  }

  join: view_01954 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01951.account_id} = ${view_01954.account_id} ;;
    required_joins: [view_01953]
  }

  join: view_01955 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01951.category} = ${view_01955.category} ;;
  }

  access_filter: {
    field: view_01951.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01951.is_deleted} = false ;;
}
