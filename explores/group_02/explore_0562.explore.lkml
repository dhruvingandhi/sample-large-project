# Update for 500 file diff target
# Explore: explore_0562
# Auto-generated LookML Explore File

include: "/views/domain_37/view_01687.view.lkml"
include: "/views/domain_39/view_01689.view.lkml"
include: "/views/domain_40/view_01690.view.lkml"
include: "/views/domain_41/view_01691.view.lkml"

explore: explore_0562 {
  label: "Explore Explore 0562"
  description: "Comprehensive analytics explore joining base view_01687 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01687
  
  always_filter: {
    filters: [view_01687.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01687.created_at_date: "7 days"]
    unless: [view_01687.id, view_01687.status]
  }

  join: view_01689 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01687.user_id} = ${view_01689.id} ;;
    required_joins: []
  }

  join: view_01690 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01687.account_id} = ${view_01690.account_id} ;;
    required_joins: [view_01689]
  }

  join: view_01691 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01687.category} = ${view_01691.category} ;;
  }

  access_filter: {
    field: view_01687.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01687.is_deleted} = false ;;
}
