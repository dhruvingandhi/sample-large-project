# Explore: explore_2908
# Auto-generated LookML Explore File

include: "/views/domain_25/view_08725.view.lkml"
include: "/views/domain_27/view_08727.view.lkml"
include: "/views/domain_28/view_08728.view.lkml"
include: "/views/domain_29/view_08729.view.lkml"

explore: explore_2908 {
  label: "Explore Explore 2908"
  description: "Comprehensive analytics explore joining base view_08725 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08725
  
  always_filter: {
    filters: [view_08725.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08725.created_at_date: "7 days"]
    unless: [view_08725.id, view_08725.status]
  }

  join: view_08727 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08725.user_id} = ${view_08727.id} ;;
    required_joins: []
  }

  join: view_08728 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08725.account_id} = ${view_08728.account_id} ;;
    required_joins: [view_08727]
  }

  join: view_08729 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08725.category} = ${view_08729.category} ;;
  }

  access_filter: {
    field: view_08725.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08725.is_deleted} = false ;;
}
