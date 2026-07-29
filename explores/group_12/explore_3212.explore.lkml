# Explore: explore_3212
# Auto-generated LookML Explore File

include: "/views/domain_37/view_09637.view.lkml"
include: "/views/domain_39/view_09639.view.lkml"
include: "/views/domain_40/view_09640.view.lkml"
include: "/views/domain_41/view_09641.view.lkml"

explore: explore_3212 {
  label: "Explore Explore 3212"
  description: "Comprehensive analytics explore joining base view_09637 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09637
  
  always_filter: {
    filters: [view_09637.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09637.created_at_date: "7 days"]
    unless: [view_09637.id, view_09637.status]
  }

  join: view_09639 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09637.user_id} = ${view_09639.id} ;;
    required_joins: []
  }

  join: view_09640 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09637.account_id} = ${view_09640.account_id} ;;
    required_joins: [view_09639]
  }

  join: view_09641 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09637.category} = ${view_09641.category} ;;
  }

  access_filter: {
    field: view_09637.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09637.is_deleted} = false ;;
}
