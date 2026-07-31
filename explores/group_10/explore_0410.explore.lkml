# Update for 2000 file diff target
# Explore: explore_0410
# Auto-generated LookML Explore File

include: "/views/domain_31/view_01231.view.lkml"
include: "/views/domain_33/view_01233.view.lkml"
include: "/views/domain_34/view_01234.view.lkml"
include: "/views/domain_35/view_01235.view.lkml"

explore: explore_0410 {
  label: "Explore Explore 0410"
  description: "Comprehensive analytics explore joining base view_01231 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01231
  
  always_filter: {
    filters: [view_01231.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01231.created_at_date: "7 days"]
    unless: [view_01231.id, view_01231.status]
  }

  join: view_01233 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01231.user_id} = ${view_01233.id} ;;
    required_joins: []
  }

  join: view_01234 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01231.account_id} = ${view_01234.account_id} ;;
    required_joins: [view_01233]
  }

  join: view_01235 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01231.category} = ${view_01235.category} ;;
  }

  access_filter: {
    field: view_01231.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01231.is_deleted} = false ;;
}
