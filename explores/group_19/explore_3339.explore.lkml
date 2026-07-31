# Update for 2000 file diff target
# Explore: explore_3339
# Auto-generated LookML Explore File

include: "/views/domain_18/view_10018.view.lkml"
include: "/views/domain_20/view_10020.view.lkml"
include: "/views/domain_21/view_10021.view.lkml"
include: "/views/domain_22/view_10022.view.lkml"

explore: explore_3339 {
  label: "Explore Explore 3339"
  description: "Comprehensive analytics explore joining base view_10018 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10018
  
  always_filter: {
    filters: [view_10018.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10018.created_at_date: "7 days"]
    unless: [view_10018.id, view_10018.status]
  }

  join: view_10020 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10018.user_id} = ${view_10020.id} ;;
    required_joins: []
  }

  join: view_10021 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10018.account_id} = ${view_10021.account_id} ;;
    required_joins: [view_10020]
  }

  join: view_10022 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10018.category} = ${view_10022.category} ;;
  }

  access_filter: {
    field: view_10018.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10018.is_deleted} = false ;;
}
