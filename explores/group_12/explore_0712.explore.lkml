# Explore: explore_0712
# Auto-generated LookML Explore File

include: "/views/domain_37/view_02137.view.lkml"
include: "/views/domain_39/view_02139.view.lkml"
include: "/views/domain_40/view_02140.view.lkml"
include: "/views/domain_41/view_02141.view.lkml"

explore: explore_0712 {
  label: "Explore Explore 0712"
  description: "Comprehensive analytics explore joining base view_02137 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02137
  
  always_filter: {
    filters: [view_02137.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02137.created_at_date: "7 days"]
    unless: [view_02137.id, view_02137.status]
  }

  join: view_02139 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02137.user_id} = ${view_02139.id} ;;
    required_joins: []
  }

  join: view_02140 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02137.account_id} = ${view_02140.account_id} ;;
    required_joins: [view_02139]
  }

  join: view_02141 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02137.category} = ${view_02141.category} ;;
  }

  access_filter: {
    field: view_02137.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02137.is_deleted} = false ;;
}
