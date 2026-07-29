# Explore: explore_2712
# Auto-generated LookML Explore File

include: "/views/domain_37/view_08137.view.lkml"
include: "/views/domain_39/view_08139.view.lkml"
include: "/views/domain_40/view_08140.view.lkml"
include: "/views/domain_41/view_08141.view.lkml"

explore: explore_2712 {
  label: "Explore Explore 2712"
  description: "Comprehensive analytics explore joining base view_08137 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08137
  
  always_filter: {
    filters: [view_08137.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08137.created_at_date: "7 days"]
    unless: [view_08137.id, view_08137.status]
  }

  join: view_08139 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08137.user_id} = ${view_08139.id} ;;
    required_joins: []
  }

  join: view_08140 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08137.account_id} = ${view_08140.account_id} ;;
    required_joins: [view_08139]
  }

  join: view_08141 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08137.category} = ${view_08141.category} ;;
  }

  access_filter: {
    field: view_08137.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08137.is_deleted} = false ;;
}
