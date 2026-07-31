# Update for 500 file diff target
# Explore: explore_0062
# Auto-generated LookML Explore File

include: "/views/domain_37/view_00187.view.lkml"
include: "/views/domain_39/view_00189.view.lkml"
include: "/views/domain_40/view_00190.view.lkml"
include: "/views/domain_41/view_00191.view.lkml"

explore: explore_0062 {
  label: "Explore Explore 0062"
  description: "Comprehensive analytics explore joining base view_00187 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00187
  
  always_filter: {
    filters: [view_00187.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00187.created_at_date: "7 days"]
    unless: [view_00187.id, view_00187.status]
  }

  join: view_00189 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00187.user_id} = ${view_00189.id} ;;
    required_joins: []
  }

  join: view_00190 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00187.account_id} = ${view_00190.account_id} ;;
    required_joins: [view_00189]
  }

  join: view_00191 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00187.category} = ${view_00191.category} ;;
  }

  access_filter: {
    field: view_00187.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00187.is_deleted} = false ;;
}
