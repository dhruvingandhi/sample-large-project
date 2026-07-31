# Update for 500 file diff target
# Explore: explore_1662
# Auto-generated LookML Explore File

include: "/views/domain_37/view_04987.view.lkml"
include: "/views/domain_39/view_04989.view.lkml"
include: "/views/domain_40/view_04990.view.lkml"
include: "/views/domain_41/view_04991.view.lkml"

explore: explore_1662 {
  label: "Explore Explore 1662"
  description: "Comprehensive analytics explore joining base view_04987 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04987
  
  always_filter: {
    filters: [view_04987.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04987.created_at_date: "7 days"]
    unless: [view_04987.id, view_04987.status]
  }

  join: view_04989 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04987.user_id} = ${view_04989.id} ;;
    required_joins: []
  }

  join: view_04990 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04987.account_id} = ${view_04990.account_id} ;;
    required_joins: [view_04989]
  }

  join: view_04991 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04987.category} = ${view_04991.category} ;;
  }

  access_filter: {
    field: view_04987.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04987.is_deleted} = false ;;
}
