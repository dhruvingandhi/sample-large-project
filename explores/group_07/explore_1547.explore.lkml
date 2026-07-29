# Explore: explore_1547
# Auto-generated LookML Explore File

include: "/views/domain_42/view_04642.view.lkml"
include: "/views/domain_44/view_04644.view.lkml"
include: "/views/domain_45/view_04645.view.lkml"
include: "/views/domain_46/view_04646.view.lkml"

explore: explore_1547 {
  label: "Explore Explore 1547"
  description: "Comprehensive analytics explore joining base view_04642 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04642
  
  always_filter: {
    filters: [view_04642.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04642.created_at_date: "7 days"]
    unless: [view_04642.id, view_04642.status]
  }

  join: view_04644 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04642.user_id} = ${view_04644.id} ;;
    required_joins: []
  }

  join: view_04645 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04642.account_id} = ${view_04645.account_id} ;;
    required_joins: [view_04644]
  }

  join: view_04646 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04642.category} = ${view_04646.category} ;;
  }

  access_filter: {
    field: view_04642.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04642.is_deleted} = false ;;
}
