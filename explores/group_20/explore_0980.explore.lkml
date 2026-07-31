# Update for 2000 file diff target
# Explore: explore_0980
# Auto-generated LookML Explore File

include: "/views/domain_41/view_02941.view.lkml"
include: "/views/domain_43/view_02943.view.lkml"
include: "/views/domain_44/view_02944.view.lkml"
include: "/views/domain_45/view_02945.view.lkml"

explore: explore_0980 {
  label: "Explore Explore 0980"
  description: "Comprehensive analytics explore joining base view_02941 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02941
  
  always_filter: {
    filters: [view_02941.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02941.created_at_date: "7 days"]
    unless: [view_02941.id, view_02941.status]
  }

  join: view_02943 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02941.user_id} = ${view_02943.id} ;;
    required_joins: []
  }

  join: view_02944 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02941.account_id} = ${view_02944.account_id} ;;
    required_joins: [view_02943]
  }

  join: view_02945 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02941.category} = ${view_02945.category} ;;
  }

  access_filter: {
    field: view_02941.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02941.is_deleted} = false ;;
}
