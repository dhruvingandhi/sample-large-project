# Explore: explore_0212
# Auto-generated LookML Explore File

include: "/views/domain_37/view_00637.view.lkml"
include: "/views/domain_39/view_00639.view.lkml"
include: "/views/domain_40/view_00640.view.lkml"
include: "/views/domain_41/view_00641.view.lkml"

explore: explore_0212 {
  label: "Explore Explore 0212"
  description: "Comprehensive analytics explore joining base view_00637 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00637
  
  always_filter: {
    filters: [view_00637.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00637.created_at_date: "7 days"]
    unless: [view_00637.id, view_00637.status]
  }

  join: view_00639 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00637.user_id} = ${view_00639.id} ;;
    required_joins: []
  }

  join: view_00640 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00637.account_id} = ${view_00640.account_id} ;;
    required_joins: [view_00639]
  }

  join: view_00641 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00637.category} = ${view_00641.category} ;;
  }

  access_filter: {
    field: view_00637.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00637.is_deleted} = false ;;
}
