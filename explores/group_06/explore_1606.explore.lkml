# Explore: explore_1606
# Auto-generated LookML Explore File

include: "/views/domain_19/view_04819.view.lkml"
include: "/views/domain_21/view_04821.view.lkml"
include: "/views/domain_22/view_04822.view.lkml"
include: "/views/domain_23/view_04823.view.lkml"

explore: explore_1606 {
  label: "Explore Explore 1606"
  description: "Comprehensive analytics explore joining base view_04819 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04819
  
  always_filter: {
    filters: [view_04819.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04819.created_at_date: "7 days"]
    unless: [view_04819.id, view_04819.status]
  }

  join: view_04821 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04819.user_id} = ${view_04821.id} ;;
    required_joins: []
  }

  join: view_04822 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04819.account_id} = ${view_04822.account_id} ;;
    required_joins: [view_04821]
  }

  join: view_04823 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04819.category} = ${view_04823.category} ;;
  }

  access_filter: {
    field: view_04819.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04819.is_deleted} = false ;;
}
