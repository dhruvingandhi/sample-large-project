# Explore: explore_3649
# Auto-generated LookML Explore File

include: "/views/domain_48/view_10948.view.lkml"
include: "/views/domain_50/view_10950.view.lkml"
include: "/views/domain_01/view_10951.view.lkml"
include: "/views/domain_02/view_10952.view.lkml"

explore: explore_3649 {
  label: "Explore Explore 3649"
  description: "Comprehensive analytics explore joining base view_10948 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10948
  
  always_filter: {
    filters: [view_10948.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10948.created_at_date: "7 days"]
    unless: [view_10948.id, view_10948.status]
  }

  join: view_10950 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10948.user_id} = ${view_10950.id} ;;
    required_joins: []
  }

  join: view_10951 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10948.account_id} = ${view_10951.account_id} ;;
    required_joins: [view_10950]
  }

  join: view_10952 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10948.category} = ${view_10952.category} ;;
  }

  access_filter: {
    field: view_10948.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10948.is_deleted} = false ;;
}
