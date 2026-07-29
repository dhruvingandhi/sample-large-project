# Explore: explore_3712
# Auto-generated LookML Explore File

include: "/views/domain_37/view_11137.view.lkml"
include: "/views/domain_39/view_11139.view.lkml"
include: "/views/domain_40/view_11140.view.lkml"
include: "/views/domain_41/view_11141.view.lkml"

explore: explore_3712 {
  label: "Explore Explore 3712"
  description: "Comprehensive analytics explore joining base view_11137 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11137
  
  always_filter: {
    filters: [view_11137.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11137.created_at_date: "7 days"]
    unless: [view_11137.id, view_11137.status]
  }

  join: view_11139 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11137.user_id} = ${view_11139.id} ;;
    required_joins: []
  }

  join: view_11140 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11137.account_id} = ${view_11140.account_id} ;;
    required_joins: [view_11139]
  }

  join: view_11141 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11137.category} = ${view_11141.category} ;;
  }

  access_filter: {
    field: view_11137.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11137.is_deleted} = false ;;
}
