# Explore: explore_3953
# Auto-generated LookML Explore File

include: "/views/domain_10/view_11860.view.lkml"
include: "/views/domain_12/view_11862.view.lkml"
include: "/views/domain_13/view_11863.view.lkml"
include: "/views/domain_14/view_11864.view.lkml"

explore: explore_3953 {
  label: "Explore Explore 3953"
  description: "Comprehensive analytics explore joining base view_11860 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11860
  
  always_filter: {
    filters: [view_11860.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11860.created_at_date: "7 days"]
    unless: [view_11860.id, view_11860.status]
  }

  join: view_11862 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11860.user_id} = ${view_11862.id} ;;
    required_joins: []
  }

  join: view_11863 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11860.account_id} = ${view_11863.account_id} ;;
    required_joins: [view_11862]
  }

  join: view_11864 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11860.category} = ${view_11864.category} ;;
  }

  access_filter: {
    field: view_11860.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11860.is_deleted} = false ;;
}
