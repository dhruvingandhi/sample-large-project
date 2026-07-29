# Explore: explore_3516
# Auto-generated LookML Explore File

include: "/views/domain_49/view_10549.view.lkml"
include: "/views/domain_01/view_10551.view.lkml"
include: "/views/domain_02/view_10552.view.lkml"
include: "/views/domain_03/view_10553.view.lkml"

explore: explore_3516 {
  label: "Explore Explore 3516"
  description: "Comprehensive analytics explore joining base view_10549 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10549
  
  always_filter: {
    filters: [view_10549.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10549.created_at_date: "7 days"]
    unless: [view_10549.id, view_10549.status]
  }

  join: view_10551 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10549.user_id} = ${view_10551.id} ;;
    required_joins: []
  }

  join: view_10552 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10549.account_id} = ${view_10552.account_id} ;;
    required_joins: [view_10551]
  }

  join: view_10553 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10549.category} = ${view_10553.category} ;;
  }

  access_filter: {
    field: view_10549.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10549.is_deleted} = false ;;
}
