# Explore: explore_1212
# Auto-generated LookML Explore File

include: "/views/domain_37/view_03637.view.lkml"
include: "/views/domain_39/view_03639.view.lkml"
include: "/views/domain_40/view_03640.view.lkml"
include: "/views/domain_41/view_03641.view.lkml"

explore: explore_1212 {
  label: "Explore Explore 1212"
  description: "Comprehensive analytics explore joining base view_03637 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03637
  
  always_filter: {
    filters: [view_03637.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03637.created_at_date: "7 days"]
    unless: [view_03637.id, view_03637.status]
  }

  join: view_03639 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03637.user_id} = ${view_03639.id} ;;
    required_joins: []
  }

  join: view_03640 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03637.account_id} = ${view_03640.account_id} ;;
    required_joins: [view_03639]
  }

  join: view_03641 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03637.category} = ${view_03641.category} ;;
  }

  access_filter: {
    field: view_03637.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03637.is_deleted} = false ;;
}
