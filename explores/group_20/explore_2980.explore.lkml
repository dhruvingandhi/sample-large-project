# Update for 2000 file diff target
# Explore: explore_2980
# Auto-generated LookML Explore File

include: "/views/domain_41/view_08941.view.lkml"
include: "/views/domain_43/view_08943.view.lkml"
include: "/views/domain_44/view_08944.view.lkml"
include: "/views/domain_45/view_08945.view.lkml"

explore: explore_2980 {
  label: "Explore Explore 2980"
  description: "Comprehensive analytics explore joining base view_08941 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08941
  
  always_filter: {
    filters: [view_08941.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08941.created_at_date: "7 days"]
    unless: [view_08941.id, view_08941.status]
  }

  join: view_08943 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08941.user_id} = ${view_08943.id} ;;
    required_joins: []
  }

  join: view_08944 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08941.account_id} = ${view_08944.account_id} ;;
    required_joins: [view_08943]
  }

  join: view_08945 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08941.category} = ${view_08945.category} ;;
  }

  access_filter: {
    field: view_08941.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08941.is_deleted} = false ;;
}
