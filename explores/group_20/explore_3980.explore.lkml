# Update for 2000 file diff target
# Explore: explore_3980
# Auto-generated LookML Explore File

include: "/views/domain_41/view_11941.view.lkml"
include: "/views/domain_43/view_11943.view.lkml"
include: "/views/domain_44/view_11944.view.lkml"
include: "/views/domain_45/view_11945.view.lkml"

explore: explore_3980 {
  label: "Explore Explore 3980"
  description: "Comprehensive analytics explore joining base view_11941 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11941
  
  always_filter: {
    filters: [view_11941.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11941.created_at_date: "7 days"]
    unless: [view_11941.id, view_11941.status]
  }

  join: view_11943 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11941.user_id} = ${view_11943.id} ;;
    required_joins: []
  }

  join: view_11944 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11941.account_id} = ${view_11944.account_id} ;;
    required_joins: [view_11943]
  }

  join: view_11945 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11941.category} = ${view_11945.category} ;;
  }

  access_filter: {
    field: view_11941.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11941.is_deleted} = false ;;
}
