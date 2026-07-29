# Explore: explore_3662
# Auto-generated LookML Explore File

include: "/views/domain_37/view_10987.view.lkml"
include: "/views/domain_39/view_10989.view.lkml"
include: "/views/domain_40/view_10990.view.lkml"
include: "/views/domain_41/view_10991.view.lkml"

explore: explore_3662 {
  label: "Explore Explore 3662"
  description: "Comprehensive analytics explore joining base view_10987 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10987
  
  always_filter: {
    filters: [view_10987.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10987.created_at_date: "7 days"]
    unless: [view_10987.id, view_10987.status]
  }

  join: view_10989 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10987.user_id} = ${view_10989.id} ;;
    required_joins: []
  }

  join: view_10990 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10987.account_id} = ${view_10990.account_id} ;;
    required_joins: [view_10989]
  }

  join: view_10991 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10987.category} = ${view_10991.category} ;;
  }

  access_filter: {
    field: view_10987.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10987.is_deleted} = false ;;
}
