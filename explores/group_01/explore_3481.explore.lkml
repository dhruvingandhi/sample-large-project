# Explore: explore_3481
# Auto-generated LookML Explore File

include: "/views/domain_44/view_10444.view.lkml"
include: "/views/domain_46/view_10446.view.lkml"
include: "/views/domain_47/view_10447.view.lkml"
include: "/views/domain_48/view_10448.view.lkml"

explore: explore_3481 {
  label: "Explore Explore 3481"
  description: "Comprehensive analytics explore joining base view_10444 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10444
  
  always_filter: {
    filters: [view_10444.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10444.created_at_date: "7 days"]
    unless: [view_10444.id, view_10444.status]
  }

  join: view_10446 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10444.user_id} = ${view_10446.id} ;;
    required_joins: []
  }

  join: view_10447 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10444.account_id} = ${view_10447.account_id} ;;
    required_joins: [view_10446]
  }

  join: view_10448 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10444.category} = ${view_10448.category} ;;
  }

  access_filter: {
    field: view_10444.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10444.is_deleted} = false ;;
}
