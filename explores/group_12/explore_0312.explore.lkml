# Explore: explore_0312
# Auto-generated LookML Explore File

include: "/views/domain_37/view_00937.view.lkml"
include: "/views/domain_39/view_00939.view.lkml"
include: "/views/domain_40/view_00940.view.lkml"
include: "/views/domain_41/view_00941.view.lkml"

explore: explore_0312 {
  label: "Explore Explore 0312"
  description: "Comprehensive analytics explore joining base view_00937 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00937
  
  always_filter: {
    filters: [view_00937.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00937.created_at_date: "7 days"]
    unless: [view_00937.id, view_00937.status]
  }

  join: view_00939 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00937.user_id} = ${view_00939.id} ;;
    required_joins: []
  }

  join: view_00940 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00937.account_id} = ${view_00940.account_id} ;;
    required_joins: [view_00939]
  }

  join: view_00941 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00937.category} = ${view_00941.category} ;;
  }

  access_filter: {
    field: view_00937.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00937.is_deleted} = false ;;
}
