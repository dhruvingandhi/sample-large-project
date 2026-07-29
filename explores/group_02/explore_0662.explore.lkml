# Explore: explore_0662
# Auto-generated LookML Explore File

include: "/views/domain_37/view_01987.view.lkml"
include: "/views/domain_39/view_01989.view.lkml"
include: "/views/domain_40/view_01990.view.lkml"
include: "/views/domain_41/view_01991.view.lkml"

explore: explore_0662 {
  label: "Explore Explore 0662"
  description: "Comprehensive analytics explore joining base view_01987 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01987
  
  always_filter: {
    filters: [view_01987.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01987.created_at_date: "7 days"]
    unless: [view_01987.id, view_01987.status]
  }

  join: view_01989 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01987.user_id} = ${view_01989.id} ;;
    required_joins: []
  }

  join: view_01990 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01987.account_id} = ${view_01990.account_id} ;;
    required_joins: [view_01989]
  }

  join: view_01991 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01987.category} = ${view_01991.category} ;;
  }

  access_filter: {
    field: view_01987.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01987.is_deleted} = false ;;
}
