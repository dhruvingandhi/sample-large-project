# Antigravity modified: branch dg-3
# Explore: explore_1005
# Auto-generated LookML Explore File

include: "/views/domain_16/view_03016.view.lkml"
include: "/views/domain_18/view_03018.view.lkml"
include: "/views/domain_19/view_03019.view.lkml"
include: "/views/domain_20/view_03020.view.lkml"

explore: explore_1005 {
  label: "Explore Explore 1005"
  description: "Comprehensive analytics explore joining base view_03016 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03016
  
  always_filter: {
    filters: [view_03016.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03016.created_at_date: "7 days"]
    unless: [view_03016.id, view_03016.status]
  }

  join: view_03018 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03016.user_id} = ${view_03018.id} ;;
    required_joins: []
  }

  join: view_03019 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03016.account_id} = ${view_03019.account_id} ;;
    required_joins: [view_03018]
  }

  join: view_03020 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03016.category} = ${view_03020.category} ;;
  }

  access_filter: {
    field: view_03016.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03016.is_deleted} = false ;;
}
