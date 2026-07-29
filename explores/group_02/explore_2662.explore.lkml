# Explore: explore_2662
# Auto-generated LookML Explore File

include: "/views/domain_37/view_07987.view.lkml"
include: "/views/domain_39/view_07989.view.lkml"
include: "/views/domain_40/view_07990.view.lkml"
include: "/views/domain_41/view_07991.view.lkml"

explore: explore_2662 {
  label: "Explore Explore 2662"
  description: "Comprehensive analytics explore joining base view_07987 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07987
  
  always_filter: {
    filters: [view_07987.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07987.created_at_date: "7 days"]
    unless: [view_07987.id, view_07987.status]
  }

  join: view_07989 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07987.user_id} = ${view_07989.id} ;;
    required_joins: []
  }

  join: view_07990 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07987.account_id} = ${view_07990.account_id} ;;
    required_joins: [view_07989]
  }

  join: view_07991 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07987.category} = ${view_07991.category} ;;
  }

  access_filter: {
    field: view_07987.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07987.is_deleted} = false ;;
}
