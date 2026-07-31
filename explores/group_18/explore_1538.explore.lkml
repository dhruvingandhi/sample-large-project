# Update for 2000 file diff target
# Explore: explore_1538
# Auto-generated LookML Explore File

include: "/views/domain_15/view_04615.view.lkml"
include: "/views/domain_17/view_04617.view.lkml"
include: "/views/domain_18/view_04618.view.lkml"
include: "/views/domain_19/view_04619.view.lkml"

explore: explore_1538 {
  label: "Explore Explore 1538"
  description: "Comprehensive analytics explore joining base view_04615 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04615
  
  always_filter: {
    filters: [view_04615.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04615.created_at_date: "7 days"]
    unless: [view_04615.id, view_04615.status]
  }

  join: view_04617 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04615.user_id} = ${view_04617.id} ;;
    required_joins: []
  }

  join: view_04618 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04615.account_id} = ${view_04618.account_id} ;;
    required_joins: [view_04617]
  }

  join: view_04619 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04615.category} = ${view_04619.category} ;;
  }

  access_filter: {
    field: view_04615.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04615.is_deleted} = false ;;
}
