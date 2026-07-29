# Explore: explore_3654
# Auto-generated LookML Explore File

include: "/views/domain_13/view_10963.view.lkml"
include: "/views/domain_15/view_10965.view.lkml"
include: "/views/domain_16/view_10966.view.lkml"
include: "/views/domain_17/view_10967.view.lkml"

explore: explore_3654 {
  label: "Explore Explore 3654"
  description: "Comprehensive analytics explore joining base view_10963 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10963
  
  always_filter: {
    filters: [view_10963.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10963.created_at_date: "7 days"]
    unless: [view_10963.id, view_10963.status]
  }

  join: view_10965 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10963.user_id} = ${view_10965.id} ;;
    required_joins: []
  }

  join: view_10966 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10963.account_id} = ${view_10966.account_id} ;;
    required_joins: [view_10965]
  }

  join: view_10967 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10963.category} = ${view_10967.category} ;;
  }

  access_filter: {
    field: view_10963.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10963.is_deleted} = false ;;
}
