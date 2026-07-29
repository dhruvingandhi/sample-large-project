# Explore: explore_2212
# Auto-generated LookML Explore File

include: "/views/domain_37/view_06637.view.lkml"
include: "/views/domain_39/view_06639.view.lkml"
include: "/views/domain_40/view_06640.view.lkml"
include: "/views/domain_41/view_06641.view.lkml"

explore: explore_2212 {
  label: "Explore Explore 2212"
  description: "Comprehensive analytics explore joining base view_06637 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06637
  
  always_filter: {
    filters: [view_06637.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06637.created_at_date: "7 days"]
    unless: [view_06637.id, view_06637.status]
  }

  join: view_06639 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06637.user_id} = ${view_06639.id} ;;
    required_joins: []
  }

  join: view_06640 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06637.account_id} = ${view_06640.account_id} ;;
    required_joins: [view_06639]
  }

  join: view_06641 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06637.category} = ${view_06641.category} ;;
  }

  access_filter: {
    field: view_06637.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06637.is_deleted} = false ;;
}
